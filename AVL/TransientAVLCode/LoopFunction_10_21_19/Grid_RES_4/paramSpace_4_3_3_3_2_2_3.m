function [aeroForces] = paramSpace_4_3_3_3_2_2_3(sailStates,airStates)

	CL = (3.816100)*sailStates.alpha + (-0.076883)*sailStates.beta + (-2.730440)*sailStates.p + (37.443401)*sailStates.q + (1.091708)*sailStates.r + (0.010717)*sailStates.de;
	CD = 0.080130;
	CY = (0.004143)*sailStates.alpha + (-0.024762)*sailStates.beta + (0.259899)*sailStates.p + (-0.194782)*sailStates.q + (-0.051704)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.268193)*sailStates.alpha + (-0.146525)*sailStates.beta + (-1.352899)*sailStates.p + (11.691131)*sailStates.q + (0.768634)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-13.465121)*sailStates.alpha + (0.285430)*sailStates.beta + (8.975942)*sailStates.p + (-141.871536)*sailStates.q + (-3.675077)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.212732)*sailStates.alpha + (0.025423)*sailStates.beta + (-0.346203)*sailStates.p + (0.776933)*sailStates.q + (-0.030515)*sailStates.r + (0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end