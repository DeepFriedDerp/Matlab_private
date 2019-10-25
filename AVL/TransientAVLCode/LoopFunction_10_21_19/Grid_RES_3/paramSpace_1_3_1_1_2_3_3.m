function [aeroForces] = paramSpace_1_3_1_1_2_3_3(sailStates,airStates)

	CL = (5.345843)*sailStates.alpha + (-0.240070)*sailStates.beta + (-3.192587)*sailStates.p + (35.244202)*sailStates.q + (1.051709)*sailStates.r + (0.009534)*sailStates.de;
	CD = -1.902530;
	CY = (0.337260)*sailStates.alpha + (-0.023200)*sailStates.beta + (0.725604)*sailStates.p + (0.589409)*sailStates.q + (0.127888)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.717548)*sailStates.alpha + (-0.437330)*sailStates.beta + (-1.780806)*sailStates.p + (14.159187)*sailStates.q + (1.210798)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-14.589715)*sailStates.alpha + (0.912367)*sailStates.beta + (12.356558)*sailStates.p + (-158.590927)*sailStates.q + (-3.393115)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.617342)*sailStates.alpha + (-0.056465)*sailStates.beta + (-1.970345)*sailStates.p + (9.703407)*sailStates.q + (-0.078611)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end