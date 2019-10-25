function [aeroForces] = paramSpace_1_2_1_2_3_1_1(sailStates,airStates)

	CL = (4.755530)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.160086)*sailStates.p + (35.325298)*sailStates.q + (-1.966991)*sailStates.r + (0.011093)*sailStates.de;
	CD = -0.626380;
	CY = (0.199028)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.766637)*sailStates.p + (0.491414)*sailStates.q + (-0.135225)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.423023)*sailStates.alpha + (0.363720)*sailStates.beta + (-0.863188)*sailStates.p + (7.713007)*sailStates.q + (-1.629286)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-12.486839)*sailStates.alpha + (0.000000)*sailStates.beta + (6.206460)*sailStates.p + (-123.667763)*sailStates.q + (6.573445)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.704452)*sailStates.alpha + (0.064134)*sailStates.beta + (1.591863)*sailStates.p + (-7.077221)*sailStates.q + (0.020060)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end