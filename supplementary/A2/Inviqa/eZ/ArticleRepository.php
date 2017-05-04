<?php

namespace Inviqa\eZ;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\API\Repository\Values\Content\LocationQuery;
use eZ\Publish\API\Repository\Values\Content\Query\Criterion;

class ArticleRepository
{
    /**
     * @var SearchService
     */
    private $searchService;

    /**
     * @param SearchService $searchService
     */
    public function __construct(SearchService $searchService)
    {
        $this->searchService = $searchService;
    }


    public function getArticlesByFieldValue($field, $fieldValue)
    {
        $query = new LocationQuery();
        $query->filter = new Criterion\LogicalAnd([
            new Criterion\Visibility(Criterion\Visibility::VISIBLE),
            new Criterion\Field($field, Criterion\Operator::EQ, $fieldValue)
        ]);

        $searchResult = $this->searchService->findContent($query);
        if (null === $searchResult) {
            /// ... throw exception ...
        }

        return array('searchHits' => $searchResult->searchHits);
    }

    public function getArticlesByParentLocation($parentLocationId)
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
}
