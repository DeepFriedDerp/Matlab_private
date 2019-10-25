function [aeroForces] = paramSpace_3_1_1_3_2_2_1(sailStates,airStates)

	CL = (3.986923)*sailStates.alpha + (0.032314)*sailStates.beta + (-2.287222)*sailStates.p + (32.569893)*sailStates.q + (0.284384)*sailStates.r + (0.010796)*sailStates.de;
	CD = 0.030820;
	CY = (0.003533)*sailStates.alpha + (-0.024737)*sailStates.beta + (0.042296)*sailStates.p + (0.065300)*sailStates.q + (-0.002779)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.179835)*sailStates.alpha + (-0.005458)*sailStates.beta + (-1.035282)*sailStates.p + (8.342573)*sailStates.q + (0.166855)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.513009)*sailStates.alpha + (-0.031551)*sailStates.beta + (7.825921)*sailStates.p + (-129.003830)*sailStates.q + (-0.935928)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.024983)*sailStates.alpha + (0.001198)*sailStates.beta + (-0.057342)*sailStates.p + (0.156124)*sailStates.q + (-0.002996)*sailStates.r + (0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end