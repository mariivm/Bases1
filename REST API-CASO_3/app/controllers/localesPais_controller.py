from app.repositories.localesPais_repository import getLocalesPais


def getLocalPorPais(pool):
    print('controller')
    return getLocalesPais(pool)
