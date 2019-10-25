function [aeroForces] = paramSpace_14_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.151134)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.847249)*sailStates.p + (26.380756)*sailStates.q + (-0.228077)*sailStates.r + (0.009542)*sailStates.de;
	CD = -0.475560;
	CY = (0.000564)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.291875)*sailStates.p + (-0.550479)*sailStates.q + (0.062099)*sailStates.r + (-0.000115)*sailStates.de;

	Cl = (0.829781)*sailStates.alpha + (0.167754)*sailStates.beta + (-0.704717)*sailStates.p + (4.808327)*sailStates.q + (-0.489715)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-15.166840)*sailStates.alpha + (0.000000)*sailStates.beta + (7.089406)*sailStates.p + (-119.415161)*sailStates.q + (0.711219)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (-0.481988)*sailStates.alpha + (-0.035657)*sailStates.beta + (0.783951)*sailStates.p + (-3.271303)*sailStates.q + (-0.031138)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end