import { Logger } from '../common'
import { data_esencial } from '../repositories/data_esencial'


export class esencialController {
    private static instance: esencialController;
    private log: Logger;

    private constructor()
    {
        this.log = new Logger();
        try
        {
            null;
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public static getInstance() : esencialController
    {
        if (!this.instance)
        {
            this.instance = new esencialController();
        }
        return this.instance;
    }

    public getFilteredClients(filter: string) : Promise<any> 
    {
        const esencialdata = new data_esencial();
        return esencialdata.getClientsByFilter(filter);
    }
}