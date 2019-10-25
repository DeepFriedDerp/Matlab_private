function [aeroForces] = paramSpace_1_2_2_2_1_2_2(sailStates,airStates)

	CL = (5.675435)*sailStates.alpha + (-0.841125)*sailStates.beta + (-6.084062)*sailStates.p + (55.431282)*sailStates.q + (2.565437)*sailStates.r + (0.011108)*sailStates.de;
	CD = -8.431150;
	CY = (2.842324)*sailStates.alpha + (-0.019356)*sailStates.beta + (1.465535)*sailStates.p + (4.210823)*sailStates.q + (0.194134)*sailStates.r + (0.000957)*sailStates.de;

	Cl = (-1.389292)*sailStates.alpha + (-1.051941)*sailStates.beta + (-4.184995)*sailStates.p + (35.924492)*sailStates.q + (2.799032)*sailStates.r + (0.005502)*sailStates.de;
	Cm = (7.447693)*sailStates.alpha + (3.649115)*sailStates.beta + (22.819971)*sailStates.p + (-239.823059)*sailStates.q + (-8.773305)*sailStates.r + (-0.082541)*sailStates.de;
	Cn = (-10.640233)*sailStates.alpha + (-0.104086)*sailStates.beta + (-3.926955)*sailStates.p + (16.634623)*sailStates.q + (-0.080651)*sailStates.r + (-0.000827)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end