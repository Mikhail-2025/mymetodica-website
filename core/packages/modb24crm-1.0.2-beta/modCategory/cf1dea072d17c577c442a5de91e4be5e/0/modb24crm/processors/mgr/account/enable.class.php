<?php

require_once(dirname(__FILE__) . '/update.class.php');

class modB24AccountEnableProcessor extends modB24AccountUpdateProcessor
{
    /**
     * @return bool
     */
    public function beforeSet()
    {
        $this->properties = array(
            'active' => true,
        );

        return true;
    }

}

return 'modB24AccountEnableProcessor';
