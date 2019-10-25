function [aeroForces] = paramSpace_4_1_1_3_1_3_3(sailStates,airStates)

	CL = (4.286729)*sailStates.alpha + (0.357379)*sailStates.beta + (-2.748627)*sailStates.p + (39.487720)*sailStates.q + (1.853009)*sailStates.r + (0.011186)*sailStates.de;
	CD = -0.252290;
	CY = (-0.024365)*sailStates.alpha + (-0.026751)*sailStates.beta + (0.610198)*sailStates.p + (-0.684401)*sailStates.q + (-0.121302)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.558381)*sailStates.alpha + (-0.151250)*sailStates.beta + (-1.414573)*sailStates.p + (13.044242)*sailStates.q + (1.444931)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-12.987730)*sailStates.alpha + (-1.227534)*sailStates.beta + (8.333925)*sailStates.p + (-140.146637)*sailStates.q + (-6.126707)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.244311)*sailStates.alpha + (0.055882)*sailStates.beta + (-1.141528)*sailStates.p + (4.797707)*sailStates.q + (-0.004758)*sailStates.r + (0.000313)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end