function [aeroForces] = paramSpace_1_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.105889)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.264529)*sailStates.p + (36.221451)*sailStates.q + (-1.768921)*sailStates.r + (0.010722)*sailStates.de;
	CD = -0.146070;
	CY = (0.079589)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.557291)*sailStates.p + (0.199284)*sailStates.q + (-0.138956)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.245807)*sailStates.alpha + (0.270814)*sailStates.beta + (-0.978077)*sailStates.p + (9.009297)*sailStates.q + (-1.353660)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-12.070292)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.572254)*sailStates.p + (-127.104668)*sailStates.q + (5.841414)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.212714)*sailStates.alpha + (0.067522)*sailStates.beta + (1.072912)*sailStates.p + (-4.219800)*sailStates.q + (-0.009221)*sailStates.r + (-0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end