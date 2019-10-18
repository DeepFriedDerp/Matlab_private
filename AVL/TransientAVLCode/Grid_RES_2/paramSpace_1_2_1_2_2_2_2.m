function [aeroForces] = paramSpace_1_2_1_2_2_2_2(sailStates,airStates)

	CL = (7.853575)*sailStates.alpha + (-0.503700)*sailStates.beta + (-2.558498)*sailStates.p + (29.474266)*sailStates.q + (0.240128)*sailStates.r + (0.008678)*sailStates.de;
	CD = -4.861370;
	CY = (1.945629)*sailStates.alpha + (0.002394)*sailStates.beta + (-0.298381)*sailStates.p + (15.899652)*sailStates.q + (-0.037030)*sailStates.r + (0.003385)*sailStates.de;

	Cl = (-1.802607)*sailStates.alpha + (-0.499156)*sailStates.beta + (-1.361776)*sailStates.p + (11.248763)*sailStates.q + (0.904303)*sailStates.r + (0.000315)*sailStates.de;
	Cm = (-13.154015)*sailStates.alpha + (2.405544)*sailStates.beta + (9.187111)*sailStates.p + (-137.594330)*sailStates.q + (-1.043874)*sailStates.r + (-0.068352)*sailStates.de;
	Cn = (-2.017265)*sailStates.alpha + (-0.082969)*sailStates.beta + (0.037304)*sailStates.p + (-11.535398)*sailStates.q + (0.143422)*sailStates.r + (-0.004502)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end