function [aeroForces] = paramSpace_1_3_1_1_1_2_2(sailStates,airStates)

	CL = (3.790771)*sailStates.alpha + (0.133658)*sailStates.beta + (-2.529014)*sailStates.p + (34.816692)*sailStates.q + (-0.456145)*sailStates.r + (0.010509)*sailStates.de;
	CD = 0.063190;
	CY = (-0.202043)*sailStates.alpha + (-0.029455)*sailStates.beta + (0.050318)*sailStates.p + (-1.671348)*sailStates.q + (0.009031)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.104594)*sailStates.alpha + (0.065854)*sailStates.beta + (-1.151448)*sailStates.p + (9.215913)*sailStates.q + (-0.271716)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-13.768358)*sailStates.alpha + (-0.566839)*sailStates.beta + (8.757857)*sailStates.p + (-136.726761)*sailStates.q + (1.611406)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.361924)*sailStates.alpha + (0.015725)*sailStates.beta + (-0.250513)*sailStates.p + (3.077436)*sailStates.q + (-0.056734)*sailStates.r + (0.000505)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end