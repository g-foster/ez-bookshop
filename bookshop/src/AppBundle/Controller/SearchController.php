<?php

namespace AppBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

class SearchController extends Controller
{
    /**
     * @Route("/", name="app_search_index")
     */
    public function indexAction()
    {
        return new Response(
          '<html><body><h1>Hello world!</h1></body></html>'
        );
    }
}