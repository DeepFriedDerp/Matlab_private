function [aeroForces] = paramSpace_13_1_4_1_2_1_1(sailStates,airStates)

	CL = (4.603568)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.943841)*sailStates.p + (26.916620)*sailStates.q + (-0.827111)*sailStates.r + (0.009600)*sailStates.de;
	CD = -0.756590;
	CY = (0.272612)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.585647)*sailStates.p + (1.304044)*sailStates.q + (0.103405)*sailStates.r + (0.000275)*sailStates.de;

	Cl = (1.275528)*sailStates.alpha + (0.240817)*sailStates.beta + (-0.755754)*sailStates.p + (4.889441)*sailStates.q + (-0.911650)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-15.787642)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.739597)*sailStates.p + (-122.917580)*sailStates.q + (2.649959)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (-1.015469)*sailStates.alpha + (-0.042463)*sailStates.beta + (1.412575)*sailStates.p + (-7.746745)*sailStates.q + (-0.065246)*sailStates.r + (-0.000492)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end