function [aeroForces] = paramSpace_1_2_2_3_2_2_3(sailStates,airStates)

	CL = (3.816100)*sailStates.alpha + (-0.076883)*sailStates.beta + (-2.730440)*sailStates.p + (37.443401)*sailStates.q + (-1.091708)*sailStates.r + (0.010717)*sailStates.de;
	CD = 0.080130;
	CY = (-0.004143)*sailStates.alpha + (-0.025190)*sailStates.beta + (-0.259899)*sailStates.p + (0.194782)*sailStates.q + (-0.051704)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.311229)*sailStates.alpha + (0.097231)*sailStates.beta + (-1.384437)*sailStates.p + (12.088100)*sailStates.q + (-0.774922)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-13.465120)*sailStates.alpha + (0.285430)*sailStates.beta + (8.975941)*sailStates.p + (-141.871536)*sailStates.q + (3.675077)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.232375)*sailStates.alpha + (0.023063)*sailStates.beta + (0.339929)*sailStates.p + (-0.697971)*sailStates.q + (-0.031766)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end