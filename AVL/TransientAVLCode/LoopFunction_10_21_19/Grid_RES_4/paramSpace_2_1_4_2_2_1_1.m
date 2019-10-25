function [aeroForces] = paramSpace_2_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.468324)*sailStates.alpha + (-0.264979)*sailStates.beta + (-2.171569)*sailStates.p + (32.627392)*sailStates.q + (-1.275171)*sailStates.r + (0.010972)*sailStates.de;
	CD = -0.451200;
	CY = (0.072891)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.513440)*sailStates.p + (-0.100922)*sailStates.q + (-0.033663)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.234716)*sailStates.alpha + (0.176078)*sailStates.beta + (-0.927631)*sailStates.p + (7.585241)*sailStates.q + (-1.096007)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-13.906184)*sailStates.alpha + (0.946579)*sailStates.beta + (7.127655)*sailStates.p + (-125.105080)*sailStates.q + (4.296195)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.461376)*sailStates.alpha + (0.018070)*sailStates.beta + (1.123928)*sailStates.p + (-5.011259)*sailStates.q + (0.005601)*sailStates.r + (-0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end