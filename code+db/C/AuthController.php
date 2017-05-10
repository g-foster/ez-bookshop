<?php

namespace AppBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use JMS\DiExtraBundle\Annotation as DI;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;
use AppBundle\Entity\Login;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Cookie;

/**
 * @Route("/auth")
 */
class AuthController extends Controller
{

    /**
     * @Route("/displayform", name="app_auth_displayform")
     * @Template("AppBundle::Auth/form.html.twig")
     * @Cache(smaxage="600")
     */
    public function displayFormAction(Request $request)
    {
        $username = '';
        $cookies = $request->cookies;
        if ($cookies->has('username')) {
            $username = $cookies->get('username');
        }

        $form = $this->createForm('AppBundle\Form\Type\LoginType', new Login());

        return array('form' => $form->createView(), 'username' => $username);
    }

    /**
     * @Route("/login", name="app_auth_dologin")
     */
    public function doLoginAction(Request $request)
    {
        $form = $this->createForm('AppBundle\Form\Type\LoginType', new Login());
        $form->handleRequest($request);
        $loginEntity = $form->getData();

        $repo = $this->getDoctrine()->getRepository('AppBundle:UserPrefs');
        $userPrefs = $repo->findOneBy(array('username' => $loginEntity->username));

        $response = $this->redirect('/');
        if (null === $userPrefs) {
            $response->headers->clearCookie('username');
            $response->headers->clearCookie('science_hide');
        } else {
            $response->headers->setCookie(new Cookie('username', $userPrefs->getUsername()));
            $response->headers->setCookie(new Cookie('science_hide', $userPrefs->getScienceHide()));
        }

        return $response;
    }
}
