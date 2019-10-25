function [aeroForces] = paramSpace_1_3_2_2_1_2_1(sailStates,airStates)

	CL = (3.792947)*sailStates.alpha + (0.121222)*sailStates.beta + (-2.114938)*sailStates.p + (31.600388)*sailStates.q + (-0.540229)*sailStates.r + (0.010425)*sailStates.de;
	CD = 0.056990;
	CY = (-0.120575)*sailStates.alpha + (-0.027419)*sailStates.beta + (-0.033056)*sailStates.p + (-1.027328)*sailStates.q + (-0.005829)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.881896)*sailStates.alpha + (0.083049)*sailStates.beta + (-0.816397)*sailStates.p + (6.196043)*sailStates.q + (-0.318993)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-13.737359)*sailStates.alpha + (-0.448028)*sailStates.beta + (7.218990)*sailStates.p + (-124.672363)*sailStates.q + (1.845594)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.164901)*sailStates.alpha + (0.014242)*sailStates.beta + (-0.006925)*sailStates.p + (1.094341)*sailStates.q + (-0.032085)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end