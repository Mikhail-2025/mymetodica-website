<?php

class modB24CRMPluginOnEmptyTrash extends modB24CRMPlugin
{
    public function run()
    {
        /** @var array $ids */
        $ids = (array)$this->modx->getOption('ids', $this->scriptProperties, array(), true);
        if (!empty($ids)){
            $c = $this->modx->newQuery('modB24Link');
            $c->command('DELETE');
            $c->where(array(
                'object_id:IN' => $ids,
                'type:IN' => array(0,1),
            ));
            $c->prepare();
            $c->stmt->execute();
        }
    }
}