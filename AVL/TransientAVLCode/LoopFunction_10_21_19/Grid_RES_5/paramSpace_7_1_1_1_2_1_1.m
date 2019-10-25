function [aeroForces] = paramSpace_7_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.185014)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.077416)*sailStates.p + (31.704828)*sailStates.q + (-1.690411)*sailStates.r + (0.011002)*sailStates.de;
	CD = -0.983820;
	CY = (0.288909)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.816611)*sailStates.p + (0.910010)*sailStates.q + (-0.028613)*sailStates.r + (0.000195)*sailStates.de;

	Cl = (1.495814)*sailStates.alpha + (0.371469)*sailStates.beta + (-0.797497)*sailStates.p + (6.144046)*sailStates.q + (-1.535930)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.650234)*sailStates.alpha + (0.000000)*sailStates.beta + (6.889672)*sailStates.p + (-123.255226)*sailStates.q + (5.760781)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (-1.061435)*sailStates.alpha + (0.012972)*sailStates.beta + (1.763901)*sailStates.p + (-8.504972)*sailStates.q + (0.008751)*sailStates.r + (-0.000381)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end