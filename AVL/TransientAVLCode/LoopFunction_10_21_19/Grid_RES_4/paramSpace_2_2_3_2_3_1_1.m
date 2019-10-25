function [aeroForces] = paramSpace_2_2_3_2_3_1_1(sailStates,airStates)

	CL = (4.786411)*sailStates.alpha + (-0.105197)*sailStates.beta + (-2.183149)*sailStates.p + (32.952290)*sailStates.q + (-1.486785)*sailStates.r + (0.011109)*sailStates.de;
	CD = -0.601490;
	CY = (0.195494)*sailStates.alpha + (-0.025191)*sailStates.beta + (-0.653109)*sailStates.p + (0.668511)*sailStates.q + (-0.042784)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.407554)*sailStates.alpha + (0.267280)*sailStates.beta + (-0.899370)*sailStates.p + (7.271579)*sailStates.q + (-1.283205)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.367266)*sailStates.alpha + (0.393743)*sailStates.beta + (7.102945)*sailStates.p + (-125.787453)*sailStates.q + (5.021847)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.692904)*sailStates.alpha + (0.020354)*sailStates.beta + (1.403984)*sailStates.p + (-6.778633)*sailStates.q + (0.011728)*sailStates.r + (-0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end