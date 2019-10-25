function [aeroForces] = paramSpace_1_1_3_1_1_2_2(sailStates,airStates)

	CL = (3.891298)*sailStates.alpha + (-0.084308)*sailStates.beta + (-2.530753)*sailStates.p + (34.701347)*sailStates.q + (-0.433165)*sailStates.r + (0.010718)*sailStates.de;
	CD = 0.032430;
	CY = (-0.202097)*sailStates.alpha + (-0.021033)*sailStates.beta + (0.089088)*sailStates.p + (-1.671347)*sailStates.q + (0.015550)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.254670)*sailStates.alpha + (-0.003754)*sailStates.beta + (-1.236922)*sailStates.p + (10.271514)*sailStates.q + (-0.223955)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-14.269110)*sailStates.alpha + (0.250985)*sailStates.beta + (8.781251)*sailStates.p + (-136.726761)*sailStates.q + (1.478736)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.390622)*sailStates.alpha + (-0.003678)*sailStates.beta + (-0.323591)*sailStates.p + (3.294352)*sailStates.q + (-0.058083)*sailStates.r + (0.000479)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end