package com.scottlogic.charts
{
    import flash.utils.Dictionary;
    import mx.charts.series.ColumnSet;
    
    /**
     * Extension to mx.charts.series.ColumnSet to expose the
     * stack totals for public use, e.g. in a data tip
     * function.
     */
    public class ColumnSet extends mx.charts.series.ColumnSet
                           implements IStackedSeries
    {
        /**
         * Constructor
         */
        public function ColumnSet()
        {
            super();
        }
        
        /**
         * @see IStackedSeries.positiveTotalsByAxis
         */
        public function get positiveTotalsByAxis():Dictionary
        {
            return posTotalsByPrimaryAxis;
        }
        
        /**
         * @see IStackedSeries.negativeTotalsByAxis
         */
        public function get negativeTotalsByAxis():Dictionary
        {
            return negTotalsByPrimaryAxis;
        }
        
        /**
         * @see IStackedSeries.stackMaximum
         */
        public function get stackMaximum():Number
        {
            return stackedMaximum;
        }
        
        /**
         * @see IStackedSeries.stackMinimum
         */
        public function get stackMinimum():Number
        {
            return stackedMinimum;
        }
    }
}