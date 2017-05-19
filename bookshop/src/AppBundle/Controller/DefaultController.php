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
    // Render the articles which belong to the particular category that has been passed in
    $response = $this->render(
      'AppBundle:BookshopCore/articles:category.html.twig', array('category' => $category)
    );

    // $response->setSharedMaxAge(60); <<< NO NEED FOR THIS since now cached in getArticlesAction()

    return $response;
  }

  public function getArticlesByCategoryAction($category)
  {
    // Get an instance of your bookshop service
    $articleRepository = $this->container->get('bookshop.articlerepository');

    // Get an array of 'searchHits' from that repository search based on category
    $articles = $articleRepository->getArticlesByFieldValue('category', $category);

    // Renders and returns the articles via your custom template
    $response = $this->render(
      'AppBundle:BookshopCore/articles:article-list.html.twig', $articles
    );

    $response->setSharedMaxAge(60);

    return $response;
  }

  public function getArticlesAction($parentLocationId)
  {
    // Get an instance of your bookshop service
    $articleRepository = $this->container->get('bookshop.articlerepository');

    // Get an array of 'searchHits' from that repository search
    $articles = $articleRepository->getArticlesByParentLocation($parentLocationId);

    // Render the articles via your custom template
    $response = $this->render(
      'AppBundle:BookshopCore/articles:article-list.html.twig', $articles
    );

    $response->setSharedMaxAge(60);

    return $response;

  }

}