function [aeroForces] = paramSpace_1_2_1_2_1_2_2(sailStates,airStates)

	CL = (5.327350)*sailStates.alpha + (-0.752482)*sailStates.beta + (-5.936584)*sailStates.p + (54.720646)*sailStates.q + (2.385158)*sailStates.r + (0.010959)*sailStates.de;
	CD = -7.543700;
	CY = (2.559802)*sailStates.alpha + (-0.018026)*sailStates.beta + (1.364044)*sailStates.p + (3.954395)*sailStates.q + (0.180140)*sailStates.r + (0.000896)*sailStates.de;

	Cl = (-1.077017)*sailStates.alpha + (-0.971312)*sailStates.beta + (-4.058480)*sailStates.p + (34.832829)*sailStates.q + (2.594175)*sailStates.r + (0.005271)*sailStates.de;
	Cm = (5.642097)*sailStates.alpha + (3.183988)*sailStates.beta + (22.201422)*sailStates.p + (-235.540375)*sailStates.q + (-8.089278)*sailStates.r + (-0.081795)*sailStates.de;
	Cn = (-9.512718)*sailStates.alpha + (-0.097575)*sailStates.beta + (-3.697285)*sailStates.p + (15.894183)*sailStates.q + (-0.076573)*sailStates.r + (-0.000710)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end