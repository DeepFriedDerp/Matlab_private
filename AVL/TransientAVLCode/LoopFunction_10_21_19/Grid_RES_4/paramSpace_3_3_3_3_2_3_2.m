function [aeroForces] = paramSpace_3_3_3_3_2_3_2(sailStates,airStates)

	CL = (4.293050)*sailStates.alpha + (-0.077743)*sailStates.beta + (-2.583562)*sailStates.p + (35.758171)*sailStates.q + (0.990420)*sailStates.r + (0.011183)*sailStates.de;
	CD = -0.189880;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.391427)*sailStates.p + (0.000000)*sailStates.q + (-0.025656)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.298980)*sailStates.alpha + (-0.216993)*sailStates.beta + (-1.197040)*sailStates.p + (9.791210)*sailStates.q + (0.850108)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.357198)*sailStates.alpha + (0.306857)*sailStates.beta + (8.610004)*sailStates.p + (-137.194580)*sailStates.q + (-3.367406)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.082182)*sailStates.alpha + (0.012588)*sailStates.beta + (-0.806246)*sailStates.p + (3.396764)*sailStates.q + (0.002228)*sailStates.r + (0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end