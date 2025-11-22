<?php

require_once(dirname(__FILE__) . '/update.class.php');

class modB24AccountDisableProcessor extends modB24AccountUpdateProcessor
{
    /**
     * @return bool
     */
    public function beforeSet()
    {
        $this->properties = array(
            'active' => false,
        );

        return true;
    }

}

return 'modB24AccountDisableProcessor';
