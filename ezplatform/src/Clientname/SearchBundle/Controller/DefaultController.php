<?php

namespace Clientname\SearchBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use eZ\Publish\API\Repository\Values\Content\LocationQuery;
use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\Core\SignalSlot\LocationService;
use eZ\Publish\API\Repository\Values\Content\Query\Criterion;
use Clientname\SearchBundle\Entity\SimpleSearch;

/**
 * @Route(service="clientname.search.controller.default")
 */
class DefaultController extends Controller
{
    /**
     * @var SearchService
     */
    private $searchService;

    /**
     * @var LocationService
     */
    private $locationService;

    /**
     * @param SearchService $searchService
     * @param SearchLocation $searchLocation
     */
    public function __construct(
        SearchService $searchService,
        LocationService $locationService
    ) {
        $this->searchService = $searchService;
        $this->locationService = $locationService;
    }

    /**
     * @Route("/", name="clientname_search_index")
     * @Template("SearchBundle::Default/index.html.twig")
     */
    public function indexAction()
    {
    }

    /**
     * @Route("/category/{category}", name="clientname_search_category", requirements={"category": "\d+"})
     * @Template("SearchBundle::Default/category.html.twig")
     */
    public function categoryAction($category)
    {
        return array('category' => $category);
    }

    /**
     * @Template("SearchBundle::Default/article-list.html.twig")
     */
    public function getArticlesByCategoryAction($category)
    {
        $query = new LocationQuery();
        $query->filter = new Criterion\LogicalAnd([
            new Criterion\Visibility(Criterion\Visibility::VISIBLE),
            new Criterion\Field('category', Criterion\Operator::EQ, $category)
        ]);

        $searchResult = $this->searchService->findContent($query);
        if (null === $searchResult) {
            /// ... throw exception ...
        }

        return array('searchHits' => $searchResult->searchHits);
    }

    /**
     * @Template("SearchBundle::Default/article-list.html.twig")
     */
    public function getArticlesAction($parentLocationId)
    {
        $query = new LocationQuery();
        $query->filter = new Criterion\LogicalAnd([
            new Criterion\Visibility(Criterion\Visibility::VISIBLE),
            new Criterion\ParentLocationId($parentLocationId)
        ]);

        $searchResult = $this->searchService->findContent($query);
        if (null === $searchResult) {
            /// ... throw exception ...
        }

        return array('searchHits' => $searchResult->searchHits);
    }

    /**
     * @Template("SearchBundle::Default/searchbox.html.twig")
     */
    public function searchBoxAction()
    {
        $form = $this->createForm('Clientname\SearchBundle\Form\Type\SimpleSearchType', new SimpleSearch());
        return array('form' => $form->createView());
    }
}
