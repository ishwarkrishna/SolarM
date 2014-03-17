package com.scottlogic.charts
{
    import flash.utils.Dictionary;
    import mx.charts.series.BarSet;
    
    /**
     * Extension to mx.charts.series.BarSet to expose the
     * stack totals for public use, e.g. in a data tip
     * function.
     */
    public class BarSet extends mx.charts.series.BarSet
                        implements IStackedSeries
    {
        /**
         * Constructor
         */
        public function BarSet()
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