function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.543171)*sailStates.alpha + (-0.713068)*sailStates.beta + (-2.620556)*sailStates.p + (39.755173)*sailStates.q + (-2.113808)*sailStates.r + (0.011360)*sailStates.de;
	CD = -0.927650;
	CY = (-0.225039)*sailStates.alpha + (-0.017704)*sailStates.beta + (-0.716355)*sailStates.p + (-1.671347)*sailStates.q + (-0.126154)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.058786)*sailStates.alpha + (0.232255)*sailStates.beta + (-1.282786)*sailStates.p + (11.838799)*sailStates.q + (-1.832333)*sailStates.r + (0.000594)*sailStates.de;
	Cm = (-10.552317)*sailStates.alpha + (2.817663)*sailStates.beta + (7.715799)*sailStates.p + (-135.584213)*sailStates.q + (7.098600)*sailStates.r + (-0.066522)*sailStates.de;
	Cn = (0.245393)*sailStates.alpha + (0.069300)*sailStates.beta + (1.471421)*sailStates.p + (-4.524034)*sailStates.q + (-0.024269)*sailStates.r + (0.000355)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end