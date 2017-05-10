<?php
namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="user_prefs")
 */
class UserPrefs
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20)
     */
    private $username;

    /**
     * @ORM\Column(type="integer")
     */
    private $biographyHide;

    /**
     * @ORM\Column(type="integer")
     */
    private $fictionHide;

    /**
     * @ORM\Column(type="integer")
     */
    private $scienceHide;

    public function getUsername()
    {
        return $this->username;
    }

    public function getBiographyHide()
    {
        return $this->biographyHide;
    }

    public function getScienceHide()
    {
        return $this->scienceHide;
    }

    public function getFictionHide()
    {
        return $this->fictionHide;
    }
}
