function [aeroForces] = paramSpace_1_2_3_2_2_2_3(sailStates,airStates)

	CL = (3.812384)*sailStates.alpha + (-0.072444)*sailStates.beta + (-2.868000)*sailStates.p + (38.560257)*sailStates.q + (-1.137738)*sailStates.r + (0.010877)*sailStates.de;
	CD = 0.071320;
	CY = (-0.006697)*sailStates.alpha + (-0.025286)*sailStates.beta + (-0.262239)*sailStates.p + (0.301043)*sailStates.q + (-0.052152)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.341119)*sailStates.alpha + (0.092817)*sailStates.beta + (-1.497079)*sailStates.p + (13.166983)*sailStates.q + (-0.796171)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-13.525994)*sailStates.alpha + (0.249302)*sailStates.beta + (9.427928)*sailStates.p + (-145.703583)*sailStates.q + (3.805959)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.286472)*sailStates.alpha + (0.022412)*sailStates.beta + (0.330906)*sailStates.p + (-0.714692)*sailStates.q + (-0.033365)*sailStates.r + (-0.000127)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end