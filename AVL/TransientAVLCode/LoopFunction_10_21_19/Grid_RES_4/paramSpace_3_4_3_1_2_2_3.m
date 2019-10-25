function [aeroForces] = paramSpace_3_4_3_1_2_2_3(sailStates,airStates)

	CL = (3.644461)*sailStates.alpha + (-0.095998)*sailStates.beta + (-3.431661)*sailStates.p + (41.879040)*sailStates.q + (0.452140)*sailStates.r + (0.011316)*sailStates.de;
	CD = 0.035200;
	CY = (0.015901)*sailStates.alpha + (-0.024526)*sailStates.beta + (0.118474)*sailStates.p + (-0.221996)*sailStates.q + (-0.007773)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.302514)*sailStates.alpha + (-0.082352)*sailStates.beta + (-1.872630)*sailStates.p + (15.814612)*sailStates.q + (0.330846)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-13.230251)*sailStates.alpha + (0.374134)*sailStates.beta + (11.641467)*sailStates.p + (-160.446381)*sailStates.q + (-1.540073)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-0.175019)*sailStates.alpha + (0.003742)*sailStates.beta + (-0.141609)*sailStates.p + (0.334877)*sailStates.q + (-0.004378)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end