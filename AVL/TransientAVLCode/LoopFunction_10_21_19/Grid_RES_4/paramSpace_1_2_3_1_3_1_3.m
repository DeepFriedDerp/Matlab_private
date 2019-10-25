function [aeroForces] = paramSpace_1_2_3_1_3_1_3(sailStates,airStates)

	CL = (7.577060)*sailStates.alpha + (-0.275373)*sailStates.beta + (-3.453730)*sailStates.p + (50.728355)*sailStates.q + (-4.002522)*sailStates.r + (0.012708)*sailStates.de;
	CD = -3.105100;
	CY = (-0.247097)*sailStates.alpha + (-0.027370)*sailStates.beta + (-1.616115)*sailStates.p + (2.326712)*sailStates.q + (-0.321382)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (3.238808)*sailStates.alpha + (0.624575)*sailStates.beta + (-1.901822)*sailStates.p + (19.022202)*sailStates.q + (-3.387376)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-12.173333)*sailStates.alpha + (1.010898)*sailStates.beta + (8.886735)*sailStates.p + (-156.352325)*sailStates.q + (13.204858)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (1.957087)*sailStates.alpha + (0.146425)*sailStates.beta + (3.280882)*sailStates.p + (-15.125080)*sailStates.q + (0.053937)*sailStates.r + (-0.000992)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end