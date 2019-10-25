function [aeroForces] = paramSpace_3_2_1_2_1_1_2(sailStates,airStates)

	CL = (4.355767)*sailStates.alpha + (-0.056861)*sailStates.beta + (-2.532950)*sailStates.p + (33.778961)*sailStates.q + (-0.487713)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.332220;
	CY = (-0.094351)*sailStates.alpha + (-0.025169)*sailStates.beta + (-0.299284)*sailStates.p + (-0.769435)*sailStates.q + (0.019697)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.258668)*sailStates.alpha + (0.169867)*sailStates.beta + (-1.211398)*sailStates.p + (9.681994)*sailStates.q + (-0.586212)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-15.022689)*sailStates.alpha + (0.261082)*sailStates.beta + (8.897454)*sailStates.p + (-136.832825)*sailStates.q + (1.694959)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.093363)*sailStates.alpha + (-0.012195)*sailStates.beta + (0.747684)*sailStates.p + (-2.935358)*sailStates.q + (-0.005824)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end