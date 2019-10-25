function [aeroForces] = paramSpace_4_4_4_1_2_1_3(sailStates,airStates)

	CL = (5.220452)*sailStates.alpha + (0.241373)*sailStates.beta + (-3.142181)*sailStates.p + (34.419571)*sailStates.q + (-0.916109)*sailStates.r + (0.009207)*sailStates.de;
	CD = -1.843610;
	CY = (-0.330713)*sailStates.alpha + (-0.022472)*sailStates.beta + (-0.684938)*sailStates.p + (-0.662185)*sailStates.q + (0.136172)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.671633)*sailStates.alpha + (0.416244)*sailStates.beta + (-1.752184)*sailStates.p + (13.883525)*sailStates.q + (-1.108960)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-14.534171)*sailStates.alpha + (-0.903293)*sailStates.beta + (12.317009)*sailStates.p + (-157.701080)*sailStates.q + (2.888719)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.553168)*sailStates.alpha + (-0.058239)*sailStates.beta + (1.919238)*sailStates.p + (-9.544816)*sailStates.q + (-0.091922)*sailStates.r + (-0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end