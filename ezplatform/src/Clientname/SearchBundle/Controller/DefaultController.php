<?php

namespace Clientname\SearchBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="clientname_search_index")
     */
    public function indexAction()
    {
        $response = new Response();
        $response->headers->set('Content-Type', 'text/html');
        $response->setContent('<html><body><h1>Hello world!</h1></body></html>');
        $response->setStatusCode(Response::HTTP_OK);
        return $response;
    }
}
