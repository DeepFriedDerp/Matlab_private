function [aeroForces] = paramSpace_4_3_2_1_1_2_2(sailStates,airStates)

	CL = (4.209821)*sailStates.alpha + (-0.085121)*sailStates.beta + (-2.431380)*sailStates.p + (35.531982)*sailStates.q + (1.408313)*sailStates.r + (0.010670)*sailStates.de;
	CD = -0.040100;
	CY = (-0.221515)*sailStates.alpha + (-0.023264)*sailStates.beta + (0.478978)*sailStates.p + (-1.664522)*sailStates.q + (-0.095215)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.445654)*sailStates.alpha + (-0.203469)*sailStates.beta + (-1.116917)*sailStates.p + (9.793941)*sailStates.q + (1.012262)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-14.037997)*sailStates.alpha + (0.290710)*sailStates.beta + (7.606298)*sailStates.p + (-132.472137)*sailStates.q + (-4.666120)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.190049)*sailStates.alpha + (0.033063)*sailStates.beta + (-0.858751)*sailStates.p + (4.502029)*sailStates.q + (0.013532)*sailStates.r + (0.000541)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end