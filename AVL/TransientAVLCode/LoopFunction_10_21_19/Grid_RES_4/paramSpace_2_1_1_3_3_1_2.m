function [aeroForces] = paramSpace_2_1_1_3_3_1_2(sailStates,airStates)

	CL = (4.334164)*sailStates.alpha + (-0.271472)*sailStates.beta + (-2.558775)*sailStates.p + (35.535927)*sailStates.q + (-1.126613)*sailStates.r + (0.010984)*sailStates.de;
	CD = -0.245940;
	CY = (0.063231)*sailStates.alpha + (-0.025475)*sailStates.beta + (-0.486182)*sailStates.p + (0.498142)*sailStates.q + (-0.031919)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.476251)*sailStates.alpha + (0.146753)*sailStates.beta + (-1.249774)*sailStates.p + (10.532403)*sailStates.q + (-0.982672)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.215820)*sailStates.alpha + (1.113568)*sailStates.beta + (8.482903)*sailStates.p + (-135.916275)*sailStates.q + (3.843074)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.119547)*sailStates.alpha + (0.016040)*sailStates.beta + (0.988455)*sailStates.p + (-4.472141)*sailStates.q + (0.005525)*sailStates.r + (-0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end