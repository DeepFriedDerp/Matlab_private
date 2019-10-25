function [aeroForces] = paramSpace_1_2_1_2_2_1_1(sailStates,airStates)

	CL = (4.426570)*sailStates.alpha + (-0.151275)*sailStates.beta + (-2.169001)*sailStates.p + (35.654186)*sailStates.q + (-1.865165)*sailStates.r + (0.011031)*sailStates.de;
	CD = -0.477830;
	CY = (0.073713)*sailStates.alpha + (-0.024625)*sailStates.beta + (-0.664078)*sailStates.p + (-0.301042)*sailStates.q + (-0.132061)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.196414)*sailStates.alpha + (0.304701)*sailStates.beta + (-0.884786)*sailStates.p + (7.996956)*sailStates.q + (-1.536037)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-11.743258)*sailStates.alpha + (0.592689)*sailStates.beta + (6.238137)*sailStates.p + (-123.990753)*sailStates.q + (6.225404)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.482368)*sailStates.alpha + (0.069003)*sailStates.beta + (1.367678)*sailStates.p + (-5.360883)*sailStates.q + (0.001159)*sailStates.r + (-0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end