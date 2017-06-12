<?php

namespace AppBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class DefaultController extends Controller {

  /**
   * @Route("/", name="index")
   */
  public function indexAction() {
    $response = $this->render('AppBundle:BookshopCore/homepage:index.html.twig');

    return $response;
  }

  /**
   * @Route("/category/{category}", name="category", requirements={"category": "\d+"})
   */
  public function categoryAction($category)
  {
    // Render the content which belong to the particular category that has been passed in
    $response = $this->render(
      'AppBundle:BookshopCore/content:category.html.twig', array('category' => $category)
    );

    // $response->setSharedMaxAge(60); <<< NO NEED FOR THIS since now cached in getContentAction()

    return $response;
  }

  public function getContentByCategoryAction($category)
  {
    // Get an instance of your bookshop service
    $repository = $this->container->get('bookshop.content.object.repository');

    // Get an array of 'searchHits' from that repository search based on category
    $content = $repository->getContentByFieldValue('category', $category);

    // Renders and returns the books via your custom template
    $response = $this->render(
      'AppBundle:BookshopCore/content:content-object-list.html.twig', $content
    );

    $response->setSharedMaxAge(60);

    return $response;
  }

  public function getContentAction($parentLocationId)
  {
    // Get an instance of your bookshop service
    $repository = $this->container->get('bookshop.content.object.repository');

    // Get an array of 'searchHits' from that repository search
    $content = $repository->getContentByParentLocation($parentLocationId);

    // Render the content via your custom template
    $response = $this->render(
      'AppBundle:BookshopCore/content:content-object-list.html.twig', $content
    );

    $response->setSharedMaxAge(60);

    return $response;

  }

}