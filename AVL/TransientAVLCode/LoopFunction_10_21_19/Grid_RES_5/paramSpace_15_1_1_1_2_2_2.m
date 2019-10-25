function [aeroForces] = paramSpace_15_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.268850)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.067076)*sailStates.p + (45.118065)*sailStates.q + (2.516711)*sailStates.r + (0.011956)*sailStates.de;
	CD = -0.589730;
	CY = (0.239497)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.764690)*sailStates.p + (0.476204)*sailStates.q + (-0.190710)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.239378)*sailStates.alpha + (-0.401067)*sailStates.beta + (-1.592828)*sailStates.p + (15.318183)*sailStates.q + (2.011452)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-10.605979)*sailStates.alpha + (0.000000)*sailStates.beta + (8.711786)*sailStates.p + (-148.858078)*sailStates.q + (-8.261541)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (-0.822109)*sailStates.alpha + (0.099997)*sailStates.beta + (-1.442810)*sailStates.p + (4.770368)*sailStates.q + (-0.042933)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end