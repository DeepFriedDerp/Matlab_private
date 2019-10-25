function [aeroForces] = paramSpace_1_2_1_1_2_1_2(sailStates,airStates)

	CL = (5.028142)*sailStates.alpha + (-0.794629)*sailStates.beta + (-6.247827)*sailStates.p + (56.826412)*sailStates.q + (2.491551)*sailStates.r + (0.011074)*sailStates.de;
	CD = -8.403560;
	CY = (2.890387)*sailStates.alpha + (-0.017105)*sailStates.beta + (1.412836)*sailStates.p + (4.493540)*sailStates.q + (0.186640)*sailStates.r + (0.001024)*sailStates.de;

	Cl = (-1.847994)*sailStates.alpha + (-1.022145)*sailStates.beta + (-4.322066)*sailStates.p + (37.231564)*sailStates.q + (2.714151)*sailStates.r + (0.005751)*sailStates.de;
	Cm = (9.788575)*sailStates.alpha + (3.361770)*sailStates.beta + (23.344912)*sailStates.p + (-244.416702)*sailStates.q + (-8.454835)*sailStates.r + (-0.083356)*sailStates.de;
	Cn = (-10.957483)*sailStates.alpha + (-0.103362)*sailStates.beta + (-3.859227)*sailStates.p + (16.394321)*sailStates.q + (-0.077667)*sailStates.r + (-0.000830)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end