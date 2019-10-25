function [aeroForces] = paramSpace_3_1_3_1_2_2_3(sailStates,airStates)

	CL = (3.644460)*sailStates.alpha + (0.095998)*sailStates.beta + (-3.431661)*sailStates.p + (41.879036)*sailStates.q + (0.452140)*sailStates.r + (0.011316)*sailStates.de;
	CD = 0.035200;
	CY = (0.015901)*sailStates.alpha + (-0.025046)*sailStates.beta + (0.118474)*sailStates.p + (-0.221996)*sailStates.q + (-0.007773)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.415285)*sailStates.alpha + (-0.015901)*sailStates.beta + (-1.970324)*sailStates.p + (17.023172)*sailStates.q + (0.337292)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-13.230251)*sailStates.alpha + (-0.374134)*sailStates.beta + (11.641467)*sailStates.p + (-160.446365)*sailStates.q + (-1.540073)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-0.195589)*sailStates.alpha + (0.002698)*sailStates.beta + (-0.135206)*sailStates.p + (0.255664)*sailStates.q + (-0.004800)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end