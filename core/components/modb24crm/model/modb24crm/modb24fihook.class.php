<?php
class modB24FIHook extends xPDOSimpleObject {

	/**
     * @param array $ancestors
     *
     * @return bool
     */
    public function remove(array $ancestors = array())
    {

        $table = $this->xpdo->getTableName('modB24Field');
        $stmt = $this->xpdo->prepare("DELETE FROM {$table} WHERE account_id = ? AND section = ?;");
        if($stmt){
            $stmt->execute(array(
                $this->get('account_id'),
                'fihook'.$this->get('id'),
            ));
        }
        $stmt->closeCursor();

        return parent::remove($ancestors);
    }
}