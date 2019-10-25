function [aeroForces] = paramSpace_4_4_1_2_1_3_3(sailStates,airStates)

	CL = (4.744944)*sailStates.alpha + (-0.458066)*sailStates.beta + (-2.904862)*sailStates.p + (41.970291)*sailStates.q + (2.337392)*sailStates.r + (0.011508)*sailStates.de;
	CD = -0.636280;
	CY = (-0.003917)*sailStates.alpha + (-0.021751)*sailStates.beta + (0.835047)*sailStates.p + (-1.057315)*sailStates.q + (-0.165988)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.710135)*sailStates.alpha + (-0.526089)*sailStates.beta + (-1.436176)*sailStates.p + (13.287468)*sailStates.q + (1.862381)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-12.667206)*sailStates.alpha + (1.604369)*sailStates.beta + (8.448283)*sailStates.p + (-143.598221)*sailStates.q + (-7.716383)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.333157)*sailStates.alpha + (0.069872)*sailStates.beta + (-1.639401)*sailStates.p + (7.358333)*sailStates.q + (0.012048)*sailStates.r + (0.000465)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end