function [aeroForces] = paramSpace_1_3_2_1_3_2_2(sailStates,airStates)

	CL = (4.168646)*sailStates.alpha + (0.215509)*sailStates.beta + (-2.441711)*sailStates.p + (35.249096)*sailStates.q + (-1.304536)*sailStates.r + (0.010597)*sailStates.de;
	CD = -0.038980;
	CY = (0.219271)*sailStates.alpha + (-0.020620)*sailStates.beta + (-0.463653)*sailStates.p + (1.671347)*sailStates.q + (-0.081755)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.390733)*sailStates.alpha + (0.237916)*sailStates.beta + (-1.096984)*sailStates.p + (9.368308)*sailStates.q + (-0.945412)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.018734)*sailStates.alpha + (-0.762083)*sailStates.beta + (7.750708)*sailStates.p + (-132.498779)*sailStates.q + (4.344321)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.217563)*sailStates.alpha + (0.025061)*sailStates.beta + (0.838456)*sailStates.p + (-4.489377)*sailStates.q + (0.015247)*sailStates.r + (-0.000535)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end