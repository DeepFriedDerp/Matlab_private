function [aeroForces] = paramSpace_12_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.494544)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.119850)*sailStates.p + (34.114986)*sailStates.q + (1.600074)*sailStates.r + (0.011329)*sailStates.de;
	CD = -0.596880;
	CY = (0.045126)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.554190)*sailStates.p + (1.241893)*sailStates.q + (-0.077930)*sailStates.r + (0.000264)*sailStates.de;

	Cl = (0.916001)*sailStates.alpha + (-0.326911)*sailStates.beta + (-0.813407)*sailStates.p + (6.798173)*sailStates.q + (1.353913)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-12.421633)*sailStates.alpha + (0.000000)*sailStates.beta + (6.485770)*sailStates.p + (-123.350212)*sailStates.q + (-5.377931)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (0.486564)*sailStates.alpha + (0.045944)*sailStates.beta + (-1.208838)*sailStates.p + (4.354254)*sailStates.q + (-0.004272)*sailStates.r + (-0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end