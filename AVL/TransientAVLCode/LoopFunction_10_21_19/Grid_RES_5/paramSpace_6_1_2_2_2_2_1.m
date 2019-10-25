function [aeroForces] = paramSpace_6_1_2_2_2_2_1(sailStates,airStates)

	CL = (4.100917)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.334241)*sailStates.p + (32.620842)*sailStates.q + (0.099951)*sailStates.r + (0.010799)*sailStates.de;
	CD = -0.055220;
	CY = (0.033900)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.108602)*sailStates.p + (0.351850)*sailStates.q + (0.007582)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.141054)*sailStates.alpha + (-0.068517)*sailStates.beta + (-1.026131)*sailStates.p + (8.002471)*sailStates.q + (0.183554)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.833742)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.116514)*sailStates.p + (-131.203201)*sailStates.q + (-0.332580)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (0.121571)*sailStates.alpha + (-0.004791)*sailStates.beta + (-0.320823)*sailStates.p + (1.430146)*sailStates.q + (-0.004584)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end