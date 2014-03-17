package com.scottlogic.charts
{
    import flash.utils.Dictionary;
    
    /**
     * Interface for StackedSeries sub-classes that expose
     * the stack totals for public use, e.g. in a data tip
     * function.
     */
    public interface IStackedSeries
    {
        function get positiveTotalsByAxis():Dictionary;
        function get negativeTotalsByAxis():Dictionary;
        function get stackMaximum():Number;
        function get stackMinimum():Number;
    }
}