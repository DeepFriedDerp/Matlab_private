function [aeroForces] = paramSpace_1_1_2_2_1_2_1(sailStates,airStates)

	CL = (3.792947)*sailStates.alpha + (-0.121222)*sailStates.beta + (-2.114938)*sailStates.p + (31.600386)*sailStates.q + (-0.540229)*sailStates.r + (0.010425)*sailStates.de;
	CD = 0.056990;
	CY = (-0.120575)*sailStates.alpha + (-0.022243)*sailStates.beta + (-0.033056)*sailStates.p + (-1.027328)*sailStates.q + (-0.005829)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.022064)*sailStates.alpha + (0.028516)*sailStates.beta + (-0.901032)*sailStates.p + (7.256910)*sailStates.q + (-0.333917)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-13.737359)*sailStates.alpha + (0.448028)*sailStates.beta + (7.218990)*sailStates.p + (-124.672379)*sailStates.q + (1.845594)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.203384)*sailStates.alpha + (0.005430)*sailStates.beta + (-0.021848)*sailStates.p + (1.281401)*sailStates.q + (-0.034717)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end