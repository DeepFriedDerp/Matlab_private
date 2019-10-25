function [aeroForces] = paramSpace_1_1_3_1_2_2_1(sailStates,airStates)

	CL = (3.627206)*sailStates.alpha + (-0.100560)*sailStates.beta + (-1.626569)*sailStates.p + (27.705385)*sailStates.q + (-0.559072)*sailStates.r + (0.010321)*sailStates.de;
	CD = 0.039380;
	CY = (-0.041584)*sailStates.alpha + (-0.023492)*sailStates.beta + (-0.083898)*sailStates.p + (-0.589407)*sailStates.q + (-0.014849)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.643326)*sailStates.alpha + (0.038658)*sailStates.beta + (-0.504432)*sailStates.p + (3.619112)*sailStates.q + (-0.327204)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-13.100027)*sailStates.alpha + (0.304707)*sailStates.beta + (5.470397)*sailStates.p + (-110.634644)*sailStates.q + (1.871884)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-0.069269)*sailStates.alpha + (0.010021)*sailStates.beta + (0.164854)*sailStates.p + (-0.341200)*sailStates.q + (-0.013080)*sailStates.r + (0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end