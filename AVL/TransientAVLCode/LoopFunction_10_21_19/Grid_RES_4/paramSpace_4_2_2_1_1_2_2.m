function [aeroForces] = paramSpace_4_2_2_1_1_2_2(sailStates,airStates)

	CL = (4.209821)*sailStates.alpha + (0.085121)*sailStates.beta + (-2.431380)*sailStates.p + (35.531982)*sailStates.q + (1.408313)*sailStates.r + (0.010670)*sailStates.de;
	CD = -0.040100;
	CY = (-0.221516)*sailStates.alpha + (-0.026689)*sailStates.beta + (0.478978)*sailStates.p + (-1.664522)*sailStates.q + (-0.095215)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.492466)*sailStates.alpha + (-0.142507)*sailStates.beta + (-1.148460)*sailStates.p + (10.190911)*sailStates.q + (1.018521)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-14.037997)*sailStates.alpha + (-0.290710)*sailStates.beta + (7.606298)*sailStates.p + (-132.472137)*sailStates.q + (-4.666120)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.165016)*sailStates.alpha + (0.035756)*sailStates.beta + (-0.852476)*sailStates.p + (4.423068)*sailStates.q + (0.012287)*sailStates.r + (0.000541)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end