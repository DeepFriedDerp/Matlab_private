function [aeroForces] = paramSpace_2_2_1_2_2_1_1(sailStates,airStates)

	CL = (5.419470)*sailStates.alpha + (-3.960304)*sailStates.beta + (-3.472723)*sailStates.p + (47.813236)*sailStates.q + (2.335464)*sailStates.r + (0.010546)*sailStates.de;
	CD = -6.344410;
	CY = (1.808841)*sailStates.alpha + (-0.246977)*sailStates.beta + (0.370675)*sailStates.p + (15.444983)*sailStates.q + (-0.040049)*sailStates.r + (0.002941)*sailStates.de;

	Cl = (-5.648254)*sailStates.alpha + (-1.293999)*sailStates.beta + (-1.688118)*sailStates.p + (14.416677)*sailStates.q + (2.557978)*sailStates.r + (0.001243)*sailStates.de;
	Cm = (6.359231)*sailStates.alpha + (17.749117)*sailStates.beta + (10.724586)*sailStates.p + (-151.835327)*sailStates.q + (-8.245934)*sailStates.r + (-0.055329)*sailStates.de;
	Cn = (-1.925012)*sailStates.alpha + (0.349402)*sailStates.beta + (-1.042211)*sailStates.p + (-8.076198)*sailStates.q + (-0.191935)*sailStates.r + (-0.003829)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end