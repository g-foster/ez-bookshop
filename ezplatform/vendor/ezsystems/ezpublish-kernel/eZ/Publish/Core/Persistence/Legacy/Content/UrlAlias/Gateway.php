<?php

/**
 * File containing the UrlAlias Gateway class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
namespace eZ\Publish\Core\Persistence\Legacy\Content\UrlAlias;

/**
 * UrlAlias Gateway.
 */
abstract class Gateway
{
    /**
     * Default database table.
     */
    const TABLE = 'ezurlalias_ml';

    /**
     * Changes the gateway database table.
     *
     * @internal
     *
     * @param string $name
     */
    abstract public function setTable($name);

    /**
     * Loads list of aliases by given $locationId.
     *
     * @param mixed $locationId
     * @param bool $custom
     * @param mixed $languageId
     *
     * @return array
     */
    abstract public function loadLocationEntries($locationId, $custom = false, $languageId = false);

    /**
     * Loads paged list of global aliases.
     *
     * @param string|null $languageCode
     * @param int $offset
     * @param int $limit
     *
     * @return array
     */
    abstract public function listGlobalEntries($languageCode = null, $offset = 0, $limit = -1);

    /**
     * Returns boolean indicating if the row with given $id is special root entry.
     *
     * Special root entry entry will have parentId=0 and text=''.
     * In standard installation this entry will point to location with id=2.
     *
     * @param mixed $id
     *
     * @return bool
     */
    abstract public function isRootEntry($id);

    /**
     * Updates single row data matched by composite primary key.
     *
     * Use optional parameter $languageMaskMatch to additionally limit the query match with languages.
     *
     * @param mixed $parentId
     * @param string $textMD5
     * @param array $values associative array with column names as keys and column values as values
     */
    abstract public function updateRow($parentId, $textMD5, array $values);

    /**
     * Inserts new row in urlalias_ml table.
     *
     * @param array $values
     *
     * @return mixed
     */
    abstract public function insertRow(array $values);

    /**
     * Loads single row matched by composite primary key.
     *
     * @param mixed $parentId
     * @param string $textMD5
     *
     * @return array
     */
    abstract public function loadRow($parentId, $textMD5);

    /**
     * Downgrades autogenerated entry matched by given $action and $languageId and negatively matched by
     * composite primary key.
     *
     * If language mask of the found entry is composite (meaning it consists of multiple language ids) given
     * $languageId will be removed from mask. Otherwise entry will be marked as history.
     *
     * @param string $action
     * @param mixed $languageId
     * @param mixed $newId
     * @param mixed $parentId
     * @param string $textMD5
     */
    abstract public function cleanupAfterPublish($action, $languageId, $newId, $parentId, $textMD5);

    /**
     * Historizes entry with $action by $languageMask.
     *
     * Used when swapping Location aliases, this ensures that given $languageMask matches a
     * single entry (database row).
     *
     * @param string $action
     * @param int $languageMask
     *
     * @return mixed
     */
    abstract public function historizeBeforeSwap($action, $languageMask);

    /**
     * Marks all entries with given $id as history entries.
     *
     * This method is used by Handler::locationMoved(). Each row is separately historized
     * because future publishing needs to be able to take over history entries safely.
     *
     * @param mixed $id
     * @param mixed $link
     */
    abstract public function historizeId($id, $link);

    /**
     * Updates parent id of autogenerated entries.
     *
     * Update includes history entries.
     *
     * @param mixed $oldParentId
     * @param mixed $newParentId
     */
    abstract public function reparent($oldParentId, $newParentId);

    /**
     * Loads path data identified by given $id.
     *
     * @param mixed $id
     *
     * @return array
     */
    abstract public function loadPathData($id);

    /**
     * Loads path data identified by given ordered array of hierarchy data.
     *
     * The first entry in $hierarchyData corresponds to the top-most path element in the path, the second entry the
     * child of the first path element and so on.
     * This method is faster than self::getPath() since it can fetch all elements using only one query, but can be used
     * only for autogenerated paths.
     *
     * @param array $hierarchyData
     *
     * @return array
     */
    abstract public function loadPathDataByHierarchy(array $hierarchyData);

    /**
     * Loads complete URL alias data by given array of path hashes.
     *
     * @param string[] $urlHashes URL string hashes
     *
     * @return array
     */
    abstract public function loadUrlAliasData(array $urlHashes);

    /**
     * Loads autogenerated entry id by given $action and optionally $parentId.
     *
     * @param string $action
     * @param mixed|null $parentId
     *
     * @return array
     */
    abstract public function loadAutogeneratedEntry($action, $parentId = null);

    /**
     * Deletes single custom alias row matched by composite primary key.
     *
     * @param mixed $parentId
     * @param string $textMD5
     *
     * @return bool
     */
    abstract public function removeCustomAlias($parentId, $textMD5);

    /**
     * Deletes all rows with given $action and optionally $id.
     *
     * If $id is set only autogenerated entries will be removed.
     *
     * @param string $action
     * @param mixed|null $id
     */
    abstract public function remove($action, $id = null);

    /**
     * Loads all autogenerated entries with given $parentId with optionally included history entries.
     *
     * @param mixed $parentId
     * @param bool $includeHistory
     *
     * @return array
     */
    abstract public function loadAutogeneratedEntries($parentId, $includeHistory = false);

    /**
     * Returns next value for "id" column.
     *
     * @return mixed
     */
    abstract public function getNextId();

    /**
     * Returns main language ID of the Content on the Location with given $locationId.
     *
     * @param int $locationId
     *
     * @return int
     */
    abstract public function getLocationContentMainLanguageId($locationId);
}